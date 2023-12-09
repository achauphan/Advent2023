#include "file_manager.h"

std::vector<std::string> FileManager::readFileToVector(const std::string filename) {
    std::vector<std::string> lines;
    std::string line;
    std::ifstream file(filename);

    if (!file.is_open()) {
        throw std::runtime_error("Error opening file" + filename);
    }

    while (std::getline(file, line)) {
        lines.push_back(line);
    }
    file.close();

    return lines;
}