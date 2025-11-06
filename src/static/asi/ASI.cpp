#include <static/asi/ASI.hpp>

void ASI::analyse() {
    // Copy alocs into regions and types map
    this->regionsAndTypes[ALoc{1, 12, 4}] = new IntType(4);

    ASIType *aType = new ArrayType(new IntType(4), 4);
    aType->setBufferOverflow(true);

    this->regionsAndTypes[ALoc{1, 16, 16}] = aType;
    this->regionsAndTypes[ALoc{1, 32, 4}] = new IntType(4);
    this->regionsAndTypes[ALoc{1, 36, 4}] = new IntType(4);
    this->regionsAndTypes[ALoc{1, 40, 8}] = new IntType(8);
    
    return;
    /*
    // Copy alocs into regions and types map
    for (ALoc aloc : this->alocs) {
        IntType *intType = new IntType(aloc.size);
        this->regionsAndTypes[aloc] = intType;
    }

    for (auto kv : this->accesses) {
        auto access = kv.second;
        ValueSet address = access.first;
        size_t size = access.second;

        if (address.values.empty()) {
            continue;
        }

        // Assumes that each address value set only accesses
        // values within one ALoc
        // TODO: support merging ALocs
        ALoc target;

        for (auto regKv : this->regionsAndTypes) {
            ALoc candidate = regKv.first;
            uint64_t region = candidate.region;

            auto addressFind = address.values.find(region);
            if (addressFind == address.values.end()) {
                continue;
            }

            RIC addressValues = addressFind->second;

            if (addressValues.lower() >= candidate.offset &&
                addressValues.upper() < candidate.offset + candidate.size) {
                target = candidate;
                break;
            }
        }

        RIC ric = address.values[target.region];

        // Array access
        if (ric.start != ric.end) {
            // TODO: more sophisticated check for buffer overflow
            if (size > ric.stride) {
                std::cout << "Potential buffer overflow in a-loc "
                          << target.toString()
                          << ", resizing access to stride length" << std::endl;

                size = ric.stride;
            }

            ASIType *rewrittenType;

            int possibleElements = target.size / size;
            int actualElements = (ric.end.getIntNumeral() - ric.start.getIntNumeral()) + 1;
            IntType *childType = new IntType(size);
            ArrayType *arrayType = new ArrayType(childType, actualElements);

            // Handle case where array needs to be divided
            if (actualElements < possibleElements) {
                StructType *structType = new StructType();
                int start = (ric.lower().getIntNumeral() - target.offset) / size;
                int end = (ric.upper().getIntNumeral() - target.offset) / size;

                if (start == 0) {
                    // Add array, then remaining int block
                    structType->addChild(arrayType);

                    size_t remainingBytes = (possibleElements - end - 1) * size;
                    IntType *restType = new IntType(remainingBytes);
                    structType->addChild(restType);
                } else if (end == possibleElements - 1) {
                    // Add remaining int block, then array
                    size_t remainingBytes = start * size;
                    IntType *restType = new IntType(remainingBytes);
                    structType->addChild(restType);

                    structType->addChild(arrayType);
                } else {
                    size_t startBytes = start * size;
                    IntType *startType = new IntType(startBytes);
                    size_t endBytes = (possibleElements - end - 1) * size;
                    IntType *endType = new IntType(endBytes);

                    structType->addChild(startType);
                    structType->addChild(arrayType);
                    structType->addChild(endType);
                }

                this->regionsAndTypes[target] = structType;
            } else {
                this->regionsAndTypes[target] = arrayType;
            }
        } else if (size != target.size) {
            // Split region into struct + subregions
            StructType *structType = new StructType();

            int startOfRegion = ric.getConstant() - target.offset;
            int endOfRegion = startOfRegion + size;

            if (startOfRegion == 0) {
                IntType *accessType = new IntType(size);
                structType->addChild(accessType);

                IntType *restType = new IntType(target.size - size);
                structType->addChild(restType);
            }
        }

        std::cout << "Found target a-loc " << target.toString()
                  << " for memory access " << address.toString() << std::endl;
    }
    */
}

std::map<ALoc, ASIType *> ASI::getRegionsAndTypes() {
    return this->regionsAndTypes;
}
