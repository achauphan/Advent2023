#ifndef FILE_MANAGER_H
#define FILE_MANAGER_H

#include <iostream>
#include <string>
#include <vector>
#include <fstream>


class FileManager {

public:
    std::vector<std::string> readFileToVector(const std::string filename);
};

#endif 