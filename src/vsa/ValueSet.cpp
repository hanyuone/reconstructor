#include <limits>
#include <vsa/ValueSet.hpp>

bool ValueSet::operator==(ValueSet &rhs) {
    for (auto kv : this->values) {
        auto rhsKv = rhs.values.find(kv.first);

        if (rhsKv == rhs.values.end()) {
            return false;
        }

        if (kv.second != (*rhsKv).second) {
            return false;
        }
    }

    return true;
}

bool ValueSet::operator!=(ValueSet &rhs) {
    return !this->operator==(rhs);
}

ValueSet ValueSet::operator+(ValueSet rhs) {
    if (this->values.find(0) != this->values.end() && this->getGlobal().isConstant()) {
        // Value at memory region 0 is constant
        ValueSet vs = rhs;
        vs.adjust(this->getConstant());
        return vs;
    } else if (this->values.find(0) != this->values.end()) {
        // Value at memory region 0 is RIC
        ValueSet vs = rhs;

        for (auto kv = vs.values.begin(); kv != vs.values.end(); kv++) {
            if (kv->second.isConstant()) {
                RIC ric = this->values[0];
                ric.offset = kv->second.getConstant();
                kv->second = ric;
            } else {
                kv->second = TOP;
            }
        }

        return vs;
    } else if (rhs.values.find(0) != rhs.values.end()) {
        return rhs + (*this);
    } else {
        ValueSet vs;
        vs.top = true;
        return vs;
    }
}

ValueSet ValueSet::operator<<(int shift) {
    ValueSet vs = (*this);
    
    for (auto it = vs.values.begin(); it != vs.values.end(); it++) {
        RIC ric = it->second;
        ric.stride <<= shift;
        ric.offset <<= shift;
        it->second = ric;
    }

    return vs;
}

bool ValueSet::isTop() {
    return this->top;
}

bool ValueSet::isBottom() {
    for (auto kv : this->values) {
        if (!kv.second.isBottom()) {
            return false;
        }
    }

    return true;
}

bool ValueSet::isSubset(ValueSet &rhs) {
    for (auto locMapping : this->values) {
        uint64_t region = locMapping.first;
        auto rhsRegion = rhs.values.find(region);

        if (rhsRegion == rhs.values.end()) {
            return false;
        }

        RIC rhsRic = (*rhsRegion).second;

        if (!locMapping.second.isSubset(rhsRic)) {
            return false;
        }
    }

    return true;
}

void ValueSet::meetWith(ValueSet &rhs) {
    for (auto it = this->values.begin(); it != this->values.end();) {
        // Find region in other section
        uint64_t region = (*it).first;
        auto rhsRegion = rhs.values.find(region);

        if (rhsRegion == rhs.values.end()) {
            it = this->values.erase(it);
        } else {
            (*it).second.meetWith((*rhsRegion).second);
            it++;
        }
    }
}

void ValueSet::joinWith(ValueSet rhs) {
    // Find regions in other section to either add or join to
    for (auto it = rhs.values.begin(); it != rhs.values.end(); it++) {
        // Find corresponding regions in this
        uint64_t region = (*it).first;
        auto lhsRegion = this->values.find(region);

        if (lhsRegion == this->values.end()) {
            this->values.insert(std::pair<uint64_t, RIC>(region, (*it).second));
        } else {
            (*lhsRegion).second.joinWith((*it).second);
        }
    }
}

/// @brief Widens the current value set, according to some other
/// value set. Currently can only widen in one direction.
/// @param rhs 
void ValueSet::widenWith(ValueSet &rhs) {
    for (auto kv = this->values.begin(); kv != this->values.end(); kv++) {
        auto rhsRegion = rhs.values.find((*kv).first);
        if (rhsRegion == rhs.values.end()) {
            continue;
        }

        (*kv).second.widenWith((*rhsRegion).second);
    }
}

void ValueSet::narrowWith(ValueSet &rhs) {
    for (auto kv = this->values.begin(); kv != this->values.end(); kv++) {
        auto rhsRegion = rhs.values.find((*kv).first);
        if (rhsRegion == rhs.values.end()) {
            continue;
        }

        (*kv).second.narrowWith((*rhsRegion).second);
    }
}

void ValueSet::adjust(int c) {
    for (auto it = this->values.begin(); it != this->values.end(); it++) {
        // TODO: handle other infinite cases
        if (!(*it).second.end.is_plus_infinity())
            (*it).second.offset += c;
    }
}

void ValueSet::removeLowerBounds() {
    for (auto ric : this->values) {
        ric.second.start = SVF::BoundedInt::minus_infinity();
    }
}

void ValueSet::removeUpperBounds() {
    for (auto ric : this->values) {
        ric.second.end = SVF::BoundedInt::plus_infinity();
    }
}

std::string ValueSet::toString() {
    std::string vsString = "{";

    for (auto kv : this->values) {
        vsString += "region" + std::to_string(kv.first) + ": " + kv.second.toString() + ", ";
    }

    vsString += "}";
    return vsString;
}
