#ifndef _MSG_UTILS_H_
#define _MSG_UTILS_H_

#include <string> 
#include <sstream>
#include <sys/time.h>
#include <sys/resource.h>
#include <vector>

class msg_utils
{
private:
	std::ostringstream stream;
    std::stringstream intStream;
public:
	msg_utils();
	int string2int();
	string string2int() ;

};

#endif 