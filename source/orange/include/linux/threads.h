#ifndef OG_THREADS_H
#define OG_THREADS_H

#if _WIN32
#include <windows.h>
#define ORANGE_THREAD_ROUTINE(FP) LPTHREAD_START_ROUTINE FP
#else
#define ORANGE_THREAD_ROUTINE(FP) void* (*FP)(void* data)
#endif


namespace orange
{
    struct thread;
    
    thread* thread_create(ORANGE_THREAD_ROUTINE(thread_function));
}


#endif