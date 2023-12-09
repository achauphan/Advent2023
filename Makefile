PROJECT_DIR := $(shell git rev-parse --show-toplevel)
UTIL_DIR  := $(PROJECT_DIR)/utilities

CXX = g++
CXX_FLAGS = -I$(UTIL_DIR)

# cmd line arg. defaults to 0
DAY = 1
TARGET = day$(DAY)

SRC_DIR   := $(PROJECT_DIR)/$(TARGET)
BUILD_DIR := $(PROJECT_DIR)/builds/$(TARGET)

# target source file extensions
SRC_EXT := cpp
# list of paths to source files
SRC_FILES := $(shell find $(SRC_DIR) -type f -name *.$(SRC_EXT))
# list of file names without full path
SRC_FILE_NAMES := $(notdir $(SRC_FILES))
# created list of object file paths
OBJ_FILES := $(patsubst %.cpp, $(BUILD_DIR)/%.o, $(SRC_FILE_NAMES))


all: $(BUILD_DIR)
	@echo "SRC_DIR=$(SRC_DIR)"
	@echo "SRC_FILES=$(SRC_FILES)"
	@echo "OBJ_FILES=$(OBJ_FILES)"
	@echo "BUILD_DIR=$(BUILD_DIR)"
	@echo "UTIL_DIR=$(UTIL_DIR)"
	@echo "Building all $(TARGET) into $(BUILD_DIR)"

# link objects
$(BUILD_DIR) : $(OBJ_FILES)
	@echo "Linking object files..."
	$(CXX) $(CXX_FLAGS) $^ -o $(BUILD_DIR)/$(TARGET)
	
$(BUILD_DIR)/%.o : $(SRC_DIR)/%.$(SRC_EXT)
	mkdir -p $(BUILD_DIR)
	$(CXX) $(CXX_FLAGS) -c -o $@ $<
	

# clean objects in build dir

.PHONY: clean

clean:
	@echo "Cleaning $(BUILD_DIR)..."
	rm -rf $(BUILD_DIR)/*.o

