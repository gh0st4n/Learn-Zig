# Learn-Zig
`Note: Masih ada Kode yang Ditulis dengan Zig <0.13.0`
## Visi Kurikulum
**Zig Bukan Sekadar Bahasa Pemograman** - **Ia adalah FILOSOFI.** Di era dimana bahasa modern menyebunyikan
kompleksitas di balik abstraksi berlapis, **Zig** memilih jalan sebaliknya : *No Hidden Control Flow, No Hidden Allocations, No Hidden Magic*.
Setiap byte yang dialokasikan adalah **Keputusan Programmer**, setiap error adalah **Nilai Yang Harus Ditangani Eksplisit.**

## Kurikulum ini dibangun di atas tiga pilar
1. **First Principle** - Memahami *mengapa* Zig didesain seperti itu, bukan sekadar *bagaimana* menggunakannya.
2. **Memory as a First-Class Citizen** - Setiap contoh kode menggunakan `Allocator` secara eksplisit, visualisasi layout memory dengan ASCII diagram.
3. **Real Systems** - Berakhir dengan membangun sistem nyata : **Custom Allocator, Async I/O, Embedded Runtime**

## Struktur

```
Learn-Zig/
│
├── README.md                       ← Visi, Filosofi Zig, Cara pakai kurikulum ini
├── daftar-isi.md                   ← Navigasi lengkap + estimasi waktu per modul
├── CHANGELOG-API.md                ← Tracking breaking changes 0.12→0.13→0.14→0.16
│
├── 01-foundations/
│   ├── materi-teori.md             ← Filosofi no-hidden-CF, toolchain, type primitives
│   ├── implementasi-kode.md        ← Hello World → Error Union → comptime hello
│   ├── visualisasi-memori.md       ← ASCII: Stack frame, nilai vs pointer
│   ├── tugas-praktik.md            ← 5 tugas bertahap (Pemula → Sepuh)
│   └── note-penting.md             ← Breaking: std.Build (bukan std.build.Builder!)
│
├── 02-memory-management/
│   ├── materi-teori.md             ← Allocator interface, comptime dispatch
│   ├── implementasi-kode.md        ← ArenaAllocator, FixedBuffer, custom allocator
│   ├── visualisasi-memori.md       ← ASCII: Heap layout, arena bump pointer, slab
│   ├── tugas-praktik.md            ← Build memory tracker, detect leaks
│   └── note-penting.md             ← Perubahan: std.heap API di 0.14+
│
├── 03-type-system/
│   ├── materi-teori.md             ← Generics, tagged unions, optionals, comptime
│   ├── implementasi-kode.md        ← Generic Stack, typed Result(T,E), comptime dispatch
│   ├── visualisasi-memori.md       ← ASCII: Union layout, tag byte, alignment padding
│   ├── tugas-praktik.md            ← Implement TypedArena(T), StaticArray(T, N)
│   └── note-penting.md             ← @typeInfo evolution, anytype vs comptime T
│
├── 04-systems-programming/
│   ├── materi-teori.md             ← Volatile, packed structs, extern, SIMD vectors
│   ├── implementasi-kode.md        ← Bit fields, C FFI, SIMD string search
│   ├── visualisasi-memori.md       ← ASCII: Packed struct bits, extern struct padding
│   ├── tugas-praktik.md            ← JSON tokenizer, SIMD memcpy, C library wrapper
│   └── note-penting.md             ← @Vector API changes, extern vs packed distinctions
│
├── 05-async-concurrency/
│   ├── materi-teori.md             ← Stackless coroutines, suspend/resume, event model
│   ├── implementasi-kode.md        ← Async file I/O, thread pool, channel primitif
│   ├── visualisasi-memori.md       ← ASCII: Coroutine frame, suspend point stack
│   ├── tugas-praktik.md            ← Async TCP echo server, producer-consumer queue
│   └── note-penting.md             ← Status async di 0.16: experimental → stable path
│
├── 06-comptime-metaprogramming/
│   ├── materi-teori.md             ← Comptime reflection, @field, @hasDecl, code gen
│   ├── implementasi-kode.md        ← Compile-time JSON schema, typed config parser
│   ├── visualisasi-memori.md       ← ASCII: Comptime eval vs runtime, monomorphization
│   ├── tugas-praktik.md            ← Build ORM layer, code generator, plugin system
│   └── note-penting.md             ← comptime var vs const rules change in 0.14+
│
├── 07-expert-systems/
│   ├── materi-teori.md             ← Freestanding target, linker scripts, MMIO, ISR
│   ├── implementasi-kode.md        ← Bare metal boot, UART driver, page allocator
│   ├── visualisasi-memori.md       ← ASCII: Virtual memory map, page table, MMIO region
│   ├── tugas-praktik.md            ← Capstone: Microkernel dengan scheduler sederhana
│   └── note-penting.md             ← Target triple syntax, freestanding libc=none
│
└── projects/                       ← Proyek lengkap yang bisa dikompilasi
    ├── 01-build-system-demo/
    ├── 02-arena-allocator/
    ├── 03-generic-hashmap/
    ├── 04-simd-json-parser/
    ├── 05-async-tcp-server/
    ├── 06-comptime-orm/
    └── 07-microkernel/
```

---

<div align="center">

    @[Gh0sT4n](https://github.com/gh0st4n) - [T4n OS](https://t4n-labs.github.io/t4n-os) - [Zig 0.16.0](https://ziglang.org/documentation/0.16.0)

    [Next ->](./daftar-isi.md)

</div>
