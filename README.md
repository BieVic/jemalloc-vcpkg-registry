# jemalloc-vcpkg-registry (Work in progress)

This is a vcpkg registry for the [jemalloc](https://github.com/jemalloc/jemalloc) project, allowing jemalloc to be easily imported as a dependency.

vcpkg.json
```json
{
  "name": "project-name",
  "version": "0",
  "dependencies": [
    "jemalloc-vcpkg"
  ]
}
```

vcpkg-configuration.json
```json
{
  "registries": [
    {
      "kind": "git",
      "repository": "https://github.com/BieVic/jemalloc-vcpkg-registry",
      "baseline": "5cc262245db5a29eb03fe90f8465a8d0f1b751c0",
      "packages": [ "jemalloc-vcpkg" ]
    }
  ]
}
```
