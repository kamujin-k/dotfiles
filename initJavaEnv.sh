#!/bin/bash
#Script for initializing a Java work environment using sdkman (https://sdkman.io/)

#colors...
CYAN='\033[0;36m'
NC='\033[0m'

#Install sdkman
echo -e "${CYAN}Installing sdkman...${NC}"

curl -s "https://get.sdkman.io" | bash

source "$HOME/.sdkman/bin/sdkman-init.sh"

#Update sdkman (in case it was already installed)
echo -e "${CYAN}Updating sdkman...${NC}"
sdk selfupdate
echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"

#Install languages and tools

echo -e "\n${CYAN}Installing Java...${NC}"
yes | sdk install java
echo -e "${CYAN}Java version installed:${NC}"
java -version
echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"


echo -e "\n${CYAN}Installing Groovy...${NC}"
yes | sdk install groovy
echo -e "${CYAN}Groovy version installed:${NC}"
groovy -version
echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"


echo -e "\n${CYAN}Installing Kotlin...${NC}"
yes | sdk install kotlin
echo -e "${CYAN}Kotlin version installed:${NC}"
kotlin -version
echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"


echo -e "\n${CYAN}Installing Gradle...${NC}"
yes | sdk install gradle
echo -e "${CYAN}Gradle version installed:${NC}"
gradle -version
echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}"


echo -e "\n${CYAN}Installing maven...${NC}"
yes | sdk install maven
echo -e "${CYAN}Maven version installed:${NC}"
mvn -version
echo -e "${CYAN}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${NC}\n"


echo -e "${CYAN}======================================================================${NC}"
echo -e "${CYAN}Finished installing everything!!!${NC}"
echo -e "${CYAN}======================================================================${NC}"
