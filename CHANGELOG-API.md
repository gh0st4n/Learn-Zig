# Adaptive Thinking — Koreksi API Kritis

Sebelum masuk ke modul pertama, berikut adalah **breaking changes utama** yang wajib diketahui (dibandingkan tutorial lama yang beredar di internet):

| Area                | Pola LAMA (deprecated)                                  | Standar BARU 0.16.0                                            |
|---------------------|---------------------------------------------------------|----------------------------------------------------------------|
| Build system        | `std.build.Builder`                                     | `std.Build` + `b.addExecutable(.{})`                           |
| Executable step     | `b.addExecutable("name", "src.zig")`                    | `b.addExecutable(.{ .name = "...", .root_source_file = ... })` |
| Install artifact    | `b.installArtifact(exe)` sudah benar, tapi path berubah | Gunakan `b.path("src/main.zig")` untuk source                  |
| Error handling      | `try` di luar fungsi                                    | Wajib dalam fungsi ber-return `!T`                             |
| Multi-ArrayList     | API internal berubah                                    | Gunakan `std.MultiArrayList(T)` dengan `.items(.field)`        |
| `@import("std").os` | Beberapa sub-namespace pindah                           | Verifikasi via `zig std` atau docs 0.16                        |
| Async               | Experimental di 0.12, revised di 0.14+                  | Status stabil di 0.16 dengan semantic baru                     |

## Estimasi Waktu & Level

| Modul            | Durasi     | Level     | Prerequisite            |
|------------------|------------|-----------|-------------------------|
| 01 — Foundations | 2–3 minggu | Pemula    | Pengetahuan C/C++ dasar |
| 02 — Memory      | 2–3 minggu | Pemula+   | Modul 01                |
| 03 — Type System | 3–4 minggu | Menengah  | Modul 01–02             |
| 04 — Systems     | 3–4 minggu | Menengah+ | Modul 01–03             |
| 05 — Async       | 3–4 minggu | Lanjutan  | Modul 01–04             |
| 06 — Comptime    | 3–4 minggu | Lanjutan  | Modul 01–03             |
| 07 — Expert      | 4–6 minggu | Sepuh     | Semua modul             |

---

<div>

    @Gh0sT4n - Forever
    [<- Previously](./daftar-isi.md) | [Next ->](./Learn/01-Foundations/01-MateriTeori.md)

</div>
