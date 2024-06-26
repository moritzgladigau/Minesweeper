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

# Home directory
MINESWEEPER_FOLDER := $(shell cd ~; pwd)

all: $(OUTDIR)/$(EXECUTABLE)

$(OUTDIR)/$(EXECUTABLE): $(SOURCES)
	@echo "Building executable: $@"
	@mkdir -p $(OUTDIR)  # Create output directory if it doesn't exist
	@echo "Creating minesweeper folder at $(MINESWEEPER_FOLDER)"  # Add this line
	gcc $(CFLAGS) -o $@ $^
	@echo "Build complete :)"


.PHONY: clean
clean:
	@echo "Cleaning up"
	@rm -rf $(OUTDIR)
	@echo "Cleanup complete"
