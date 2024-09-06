#include <iostream>
#include <filesystem>
#include <cstdlib>
#include <vector>

namespace fs = std::filesystem;

void compile_and_run(const std::string& dir) {
    std::vector<std::string> object_files;

    for (const auto& entry : fs::directory_iterator(dir)) {
        if (entry.is_regular_file() && entry.path().extension() == ".asm") {
            std::string asm_file = entry.path().string();
            std::string object_file = entry.path().stem().string() + ".o";
            std::string executable_file = entry.path().stem().string() + ".out";

            // Compile .asm file to .o file
            std::string compile_command = "nasm -f elf32 " + asm_file + " -o " + object_file;
            if (std::system(compile_command.c_str()) != 0) {
                std::cerr << "Failed to compile " << asm_file << std::endl;
                continue;
            }

            object_files.push_back(object_file);
        }
    }

    if (object_files.empty()) {
        std::cerr << "No object files to link." << std::endl;
        return;
    }

    // Create the link command
    std::string link_command = "ld -m elf_i386 -o calculator ";
    for (const auto& obj : object_files) {
        link_command += obj + " ";
    }
    link_command += "-lc -dynamic-linker /lib/ld-linux.so.2";  // Link with C standard library

    // Link .o files to create an executable
    if (std::system(link_command.c_str()) != 0) {
        std::cerr << "Failed to link object files." << std::endl;
        return;
    }

    // Optionally clear the screen (if desired)
    // std::system("clear");

    // Remove object files
    for (const auto& obj : object_files) {
        if (std::remove(obj.c_str()) != 0) {
            std::cerr << "Failed to remove " << obj << std::endl;
        }
    }

    // Run the executable
    system("clear");
    if (std::system("./calculator") != 0) {
        std::cerr << "Failed to run program" << std::endl;
    }
}

int main() {
    std::string directory = "."; // Current directory
    compile_and_run(directory);
    return 0;
}
