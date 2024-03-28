# Compilation flags
CFLAGS = -Wall -Wextra -ansi -pedantic

# Source files directory
SRCDIR = src

# Output directory
OUTDIR = bin

# Source files
SOURCES = $(wildcard $(SRCDIR)/*.c)

# Executable name
EXECUTABLE = minesweeper

all: $(OUTDIR)/$(EXECUTABLE)

# Get the current user's home directory
ifndef HOME
HOME := $(shell echo $$HOME)
endif

# Print the home directory
$(info ---> Das ist das HomeDir: $(HOME_DIR))

# Define the path to the minesweeper folder
MINESWEEPER_FOLDER = $(HOME_DIR)/Library/Application\ Support/


$(OUTDIR)/$(EXECUTABLE): $(SOURCES)
	@echo "Building executable: $@"
	@mkdir -p $(OUTDIR)  # Create output directory if it doesn't exist
	@echo "Creating minesweeper folder at $(MINESWEEPER_FOLDER)"  # Add this line
	@mkdir -p $(MINESWEEPER_FOLDER) # Create minesweeper folder
	gcc $(CFLAGS) -o $@ $^
	@echo "Build complete :)"

.PHONY: clean
clean:
	@echo "Cleaning up"
	@rm -rf $(OUTDIR)
	@echo "Cleanup complete"