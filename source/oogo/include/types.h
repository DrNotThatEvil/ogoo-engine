// Ogoo.h 

#ifndef _OGOO_TYPES_H
#define _OGOO_TYPES_H

#ifdef _WIN32
    #define OGOO_TREAD_RETURN_VAL dword __stdcall
#else
    #define OGOO_TREAD_RETURN_VAL void*
#endif

#endif