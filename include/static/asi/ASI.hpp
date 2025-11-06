#pragma once

#include <static/asi/ASIType.hpp>
#include <static/vsa/AbstractStore.hpp>
#include <static/vsa/ValueSet.hpp>

class ASI {
  public:
    ASI(std::map<SVF::NodeID, std::pair<ValueSet, size_t>> _accesses,
        std::vector<ALoc> _alocs)
        : accesses(_accesses), alocs(_alocs) {}

    void analyse();
    std::map<ALoc, ASIType *> getRegionsAndTypes();

  private:
    std::map<SVF::NodeID, std::pair<ValueSet, size_t>> accesses;
    std::vector<ALoc> alocs;

    std::map<ALoc, ASIType *> regionsAndTypes;
};
