#include <binder/IServiceManager.h>
#include <binder/IPCThreadState.h>
#include <binder/ProcessState.h>
#include "IMyService.h"

using namespace android;

int main() {
    //获取service manager引用
    sp <IServiceManager> sm = defaultServiceManager();
    //注册名为"service.myservice"的服务到service manager
    sm->addService(String16("service.myservice"), new BnMyService());
    ProcessState::self()->startThreadPool(); //启动线程池
    IPCThreadState::self()->joinThreadPool(); //把主线程加入线程池
    return 0;
}
