# EasyDispatcher

```swift
dispatch$.async(.Background){}
dispatch$.async(.Low)       {}
dispatch$.async(.Default)   {}
dispatch$.async(.High)      {}

dispatch$.async_background {}
dispatch$.async_low        {}
dispatch$.async_default    {}
dispatch$.async_high       {}

dispatch$.async_after(.Background,  5.0) {}
dispatch$.async_after(.Low,         5.0) {}
dispatch$.async_after(.Default,     5.0) {}
dispatch$.async_after(.High,        5.0) {}

dispatch$.main {}
dispatch$.main_sync {}          // Be careful about this
dispatch$.main_after(1.0) {}
```
