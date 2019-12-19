#include "msg_utils.h"

msg_utils::msg_utils(){}
int msg_utils::string2int(std::string input){
    int output = -1;
    intStream.clear();
    intStream << input;
    intStream >> output;
    return output;
}
std::string msg_utils::int2string(int input){
    stream.clear();  
    stream.str("");
    stream << input;
    return stream.str();
}