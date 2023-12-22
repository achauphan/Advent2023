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
UTIL_SRC_FILES := $(shell find $(UTIL_DIR) -type f -name *.$(SRC_EXT))
# list of file names without full path
SRC_FILE_NAMES := $(notdir $(SRC_FILES))
SRC_FILE_NAMES += $(notdir $(UTIL_SRC_FILES))
# created list of object file paths
OBJ_FILES := $(patsubst %.cpp, $(BUILD_DIR)/%.o, $(SRC_FILE_NAMES))


all: $(BUILD_DIR)
	@echo "SRC_DIR=$(SRC_DIR)"
	@echo "SRC_FILES=$(SRC_FILES)"
	@echo "OBJ_FILES=$(OBJ_FILES)"
	@echo "BUILD_DIR=$(BUILD_DIR)"
	@echo "UTIL_DIR=$(UTIL_DIR)"
	@echo "Building all $(TARGET) into $(BUILD_DIR)"

# compile object files	
$(BUILD_DIR)/%.o : $(SRC_DIR)/%.$(SRC_EXT)
	@echo "Assembling source directory: $<"
	mkdir -p $(BUILD_DIR)
	$(CXX) $(CXX_FLAGS) -c -o $@ $<

$(BUILD_DIR)/%.o : $(UTIL_DIR)/%.$(SRC_EXT)
	@echo "Assembling utilities directory: $<"
	mkdir -p $(BUILD_DIR)
	$(CXX) $(CXX_FLAGS) -c -o $@ $<

# link objects and create an executable
$(BUILD_DIR) : $(OBJ_FILES)
	@echo "Linking object files..."
	@echo "SRC_FILE_NAMES=$(SRC_FILE_NAMES)"
	$(CXX) $(CXX_FLAGS) $^ -o $(BUILD_DIR)/$(TARGET)


# clean objects in build dir

.PHONY: clean

clean:
	@echo "Cleaning $(BUILD_DIR)..."
	rm -rf $(BUILD_DIR)/*.o

