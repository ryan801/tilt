#!/bin/bash
# =============================================================================
# TILT (TILT) - Fork Setup Script
# Converts Nerva (XNV) codebase to Tilt cryptocurrency
# =============================================================================

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${CYAN}"
echo "  _____ ___ _   _____  "
echo " |_   _|_ _| | |_   _| "
echo "   | |  | || |   | |   "
echo "   | |  | || |___| |   "
echo "   |_| |___|_____|_|   "
echo ""
echo "  The game is always changing."
echo -e "${NC}"

# =============================================================================
# STEP 1: Clean git history and start fresh
# =============================================================================
echo -e "${GREEN}[1/6] Initializing fresh git repository...${NC}"

cd "$(dirname "$0")"
TILT_ROOT=$(pwd)

if [ -d ".git" ]; then
    rm -rf .git
    echo "  ✓ Removed old git history"
fi

git init
echo "  ✓ Initialized new repository"

# =============================================================================
# STEP 2: Rename files
# =============================================================================
echo -e "${GREEN}[2/6] Renaming binary references...${NC}"

# These are the main binary/file renames needed
# nervad -> tiltd
# nerva-wallet-cli -> tilt-wallet-cli
# nerva-wallet-rpc -> tilt-wallet-rpc
# nerva-blockchain-* -> tilt-blockchain-*

# Find and replace in CMakeLists.txt and source files
find . -type f \( -name "CMakeLists.txt" -o -name "*.cmake" \) -exec sed -i \
    -e 's/nervad/tiltd/g' \
    -e 's/nerva-wallet/tilt-wallet/g' \
    -e 's/nerva-blockchain/tilt-blockchain/g' \
    -e 's/nerva-gen/tilt-gen/g' \
    {} \;

echo "  ✓ Updated CMake files"

# =============================================================================
# STEP 3: Update string references
# =============================================================================
echo -e "${GREEN}[3/6] Updating string references throughout codebase...${NC}"

# Mass find and replace across the codebase
# Be careful with case sensitivity

find . -type f \( -name "*.cpp" -o -name "*.h" -o -name "*.hpp" -o -name "*.c" \) \
    -not -path "./external/*" -exec sed -i \
    -e 's/NERVA/TILT/g' \
    -e 's/Nerva/Tilt/g' \
    -e 's/nerva/tilt/g' \
    -e 's/XNV/TILT/g' \
    -e 's/xnv/tilt/g' \
    {} \;

echo "  ✓ Updated source files"

# Update documentation
find . -type f \( -name "*.md" -o -name "*.txt" -o -name "*.rst" \) -exec sed -i \
    -e 's/NERVA/TILT/g' \
    -e 's/Nerva/Tilt/g' \
    -e 's/nerva/tilt/g' \
    -e 's/XNV/TILT/g' \
    {} \;

echo "  ✓ Updated documentation"

# =============================================================================
# STEP 4: Update network configuration
# =============================================================================
echo -e "${GREEN}[4/6] Preparing network configuration...${NC}"

CONFIG_FILE="src/cryptonote_config.h"

if [ -f "$CONFIG_FILE" ]; then
    echo -e "${YELLOW}  ! Manual edits required in: $CONFIG_FILE${NC}"
    echo "    See TILT_MANUAL_CHANGES.md for details"
else
    echo -e "${RED}  ! Config file not found at expected location${NC}"
    echo "    You'll need to find cryptonote_config.h manually"
fi

# =============================================================================
# STEP 5: Update ASCII art / branding
# =============================================================================
echo -e "${GREEN}[5/6] Updating branding...${NC}"

# Replace ASCII logo if it exists
if [ -f "ascii-logo.txt" ]; then
    cat > ascii-logo.txt << 'LOGO'
  _____ ___ _   _____  
 |_   _|_ _| | |_   _| 
   | |  | || |   | |   
   | |  | || |___| |   
   |_| |___|_____|_|   
                       
 The game is always changing.
LOGO
    echo "  ✓ Updated ASCII logo"
fi

# =============================================================================
# STEP 6: Summary
# =============================================================================
echo -e "${GREEN}[6/6] Automated changes complete!${NC}"
echo ""
echo -e "${CYAN}========================================${NC}"
echo -e "${CYAN}  MANUAL CHANGES STILL REQUIRED${NC}"
echo -e "${CYAN}========================================${NC}"
echo ""
echo "Read TILT_MANUAL_CHANGES.md for critical manual edits:"
echo ""
echo "  1. Network magic bytes (MUST change or you'll connect to Nerva network)"
echo "  2. Address prefixes (wallet addresses)"
echo "  3. Default P2P and RPC ports"
echo "  4. Genesis block (create your own)"
echo "  5. Seed nodes (your infrastructure)"
echo "  6. Pre-mine amount and address"
echo "  7. Emission curve / block rewards"
echo ""
echo -e "${YELLOW}DO NOT SKIP THE MANUAL CHANGES${NC}"
echo -e "${YELLOW}Running without them will break things or connect to wrong network${NC}"
echo ""

# Initial commit
git add .
git commit -m "Initial commit: forked from Nerva, renamed to Tilt"

echo -e "${GREEN}✓ Created initial git commit${NC}"
echo ""
echo "Next steps:"
echo "  1. Read TILT_MANUAL_CHANGES.md"
echo "  2. Make manual edits"
echo "  3. Build and test"
echo ""
