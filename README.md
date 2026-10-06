# 🚀 Single-Cycle RISC-V Processor Design & ASIC Implementation

Dự án thiết kế và hiện thực hóa vi xử lý **Single-Cycle RISC-V CPU** sử dụng luồng thiết kế tự động **OpenLane** với thư viện công nghệ **SkyWater 130nm (`sky130_fd_sc_hd`)**.

---

## 📊 Tổng quan thông số thiết kế (Key Metrics)

Các kết quả thống kê sau khi hoàn tất tổng hợp (Synthesis), đặt và đi dây tự động (Placement & Routing) và kiểm tra Signoff:

| Thông số | Giá trị |
|---|---|
| Technology | SkyWater 130nm HD (`sky130_fd_sc_hd`) |
| Tổng số cell | `10,277` standard cells |
| Die area | `0.339 mm²` |
| Diện tích standard cell | `96,097.16 µm²` |
| Wires / Wire bits | `10,155` / `10,279` |

---

## ⏱️ Kết quả kiểm tra thời gian (Timing Analysis - OpenSTA)

Thiết kế đạt Timing Closure, không có vi phạm ở các corner đã kiểm tra:

| Chỉ số | Giá trị | Ý nghĩa |
|---|---|---|
| TNS (Total Negative Slack) | `0.00 ns` | Không có vi phạm tổng thể |
| WNS (Worst Negative Slack) | `0.00 ns` | Không có đường nào trễ quá hạn mức |
| Setup Worst Slack | `+6.97 ns` | Đảm bảo thời gian thiết lập (setup) |
| Hold Worst Slack | `+0.32 ns` | Đảm bảo thời gian giữ dữ liệu (hold) |

---

## 🔍 Kết quả kiểm tra Signoff

| Kiểm tra | Kết quả |
|---|---|
| **DRC** (Design Rule Check) | ✅ Passed, `0` vi phạm quy tắc thiết kế vật lý |
| **LVS** (Layout vs Schematic) | ✅ Passed, `Circuits match uniquely` |

---

## 🖼️ Hình ảnh trực quan (Layout & Reports)

### 1. Thống kê tổng hợp logic (Yosys Statistics)
![Yosys Statistics](https://github.com/user-attachments/assets/ca3a3441-976e-41da-9222-7d27fcd374ec)

### 2. Báo cáo Timing (OpenSTA)
![Timing Report](https://github.com/user-attachments/assets/b6c0b23e-4e3f-42ee-b7e0-663cec4317ae)

### 3. Layout sau Routing (OpenROAD)
![Routing Layout](https://github.com/user-attachments/assets/124407be-fb46-4f2c-940f-369f83f2790d)

### 4. Floorplan (xem bằng KLayout)
Gồm die area, vị trí chân I/O quanh viền và lưới nguồn VPWR/VGND.

![Floorplan](https://github.com/user-attachments/assets/5557f1ee-e85a-47d1-b732-e4aba9065410)
