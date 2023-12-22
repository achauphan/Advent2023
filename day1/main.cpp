
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

    inputs = fileManager.readFileToVector("/home/anderson/workspace/Advent2023/day1/input.txt");

    for (const std::string& s : inputs) {
        std::cout << s << std::endl;
        // for (int i=0; i<s.length(); i++) {
        //     inputs.
        // }

    }




    return 0;
}



