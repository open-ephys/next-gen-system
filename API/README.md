# Open Instruments (OI) API Specification

## Attribution
__Authors__

- Aaron Cuevas Lopez
- Goncalo Lopes
- Jon Newman
- Jakob Voigts

__Participating Projects and Organizations__

- Bonsai
- Open Ephys
- RTXI


- Intan?
- Spike Gadgets?
- NeuroPixel?
- Leaf Labs?

## Specification
- Every function returns a 32-bit signed int specifying an error code (will be
  `typedef`ed)

### oiCreateContext
Create open instruments hardware context

```
int oiCreateContext(const char *spec, void **c)
```

__Description__ During successful context creation the following actions take
place

  1. Physical transport is defined (e.g. PCIe, socket, etc)
  2. The connection state machine is set to DISCONNECTED

### oiDestroyContext
Terminate a open instruments context and free bound resources

```
int oiDestroyContext(void *c)
```
__Description__ Context termination is performed in the following steps:

  1. Any blocking operations will return immediately with error code eTERM?
  2. Attached port resources are released
  3. The connection state machine is UNINITIALIZED

### oiConnect
Bind an open instruments context to a physical port

```
int oiConnect(void *c, int port, int flags=DFLT_FLAG)
```

### oiDisconnect
Disconnect an open instruments context from a physical port

```
int oiDisconnect(void *c, int port)
```

__Description__ Set context state machine to DISCONNECTED

### oiGetConfig
Get a configuration register from a device on a connected port

```
int oiGetConfig(const void *c, int port, int key, int *value)
```

### oiSetConfig
Set a configuration register on a device on a connected port

```
int oiSetConfig(const void *c, int port, int key, int value)
```

### oiOpenStream
Open a data stream on a connected port

```
int oiOpenStream(void *c, int port, int stream=DFLT_STREAM)
```

### oiCloseStream
Close data stream on a connected port

```
int oiCloseStream(void *c, int port)
```

### oiRead
Read data from an open stream

```
int oiRead(void *c, int port, int stream, int nbytes, void *data)
```

### oiWrite
Write data to an open stream

```
int oiWrite(void *c, int port, int stream, int nbytes, const void *data)
```

### TODO
- __Reflection functions__ function calls for enumerating attached devices, IO type, etc

## Types
1. `oiContext` (`void *`)
