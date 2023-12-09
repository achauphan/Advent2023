
#include <iostream>
#include <vector>
#include <string>
#include <fstream>
#include <sstream>

#include "file_manager.h"

int main() {
    
    FileManager fileManager;

    std::vector<std::string> inputs;
    std::string str;
    int count;
    
    // open file
    // std::ifstream file_handler("input.txt");
    // if (!file_handler.is_open()) {
    //     std::cerr << "Failed to open file." << std::endl;
    //     return 1;
    // }

    // // read next line from file until EOF
    // while (std::getline(file_handler, str)) {
    //     // push read line to vector
    //     inputs.push_back(str);
    // }

    inputs = fileManager.readFileToVector("input.txt");

    for (const std::string& s : inputs) {
        std::cout << s << std::endl;
    }

    return 0;
}



