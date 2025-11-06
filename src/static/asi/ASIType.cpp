#include <static/asi/ASIType.hpp>

size_t IntType::getSize() {
    return this->bytes;
}

std::string IntType::toString() {
    return "i" + std::to_string(this->bytes * 8);
}

size_t ArrayType::getSize() {
    return this->childType->getSize() * this->children;
}

std::string ArrayType::toString() {
    return this->childType->toString() + "[" + std::to_string(this->children) + "]";
}

size_t StructType::getSize() {
    size_t sum = 0;

    for (ASIType *child : this->children) {
        sum += child->getSize();
    }

    return sum;
}

std::string StructType::toString() {
    std::string rep = "{";

    for (auto it = this->children.begin(); it != this->children.end(); it++) {
        if (it != this->children.begin()) {
            rep += ", ";
        }

        rep += (*it)->toString();
    }

    rep += "}";
    return rep;
}

void StructType::addChild(ASIType *child) {
    this->children.push_back(child);
}