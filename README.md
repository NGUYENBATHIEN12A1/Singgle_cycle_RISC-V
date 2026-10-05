# 🚀 Single-Cycle RISC-V Processor Design & ASIC Implementation

Dự án thiết kế và hiện thực hóa vi xử lý **Single-Cycle RISC-V CPU** sử dụng luồng thiết kế tự động **OpenLane** với thư viện công nghệ **SkyWater 130nm (sky130_fd_sc_hd)**.

---

## 📊 Tổng quan thông số thiết kế (Key Metrics)

Dưới đây là các kết quả thống kê quan trọng sau khi hoàn tất quá trình tổng hợp (Synthesis), đi dây tự động (Routing) và kiểm tra ký hiệu (Signoff):

* **Technology:** SkyWater 130nm HD (`sky130_fd_sc_hd`)
* **Total Cells:** `10,277` standard cells
* **Chip/Core Area:** `96,097.16 µm²` (`0.339 mm²`)
* **Total Wires / Wire bits:** `10,155` / `10,279`

---

## ⏱️ Kết quả kiểm tra thời gian (Timing Analysis - OpenSTA)

Thiết kế đã đạt hội tụ thời gian tuyệt đối (Timing Closure) với các thông số Slack tối ưu ở các góc hoạt động (corners):

* **TNS (Total Negative Slack):** `0.00 ns` (Không có vi phạm tổng thể)
* **WNS (Worst Negative Slack):** `0.00 ns` (Không có đường trễ quá hạn mức)
* **Setup Worst Slack:** `+6.97 ns` (Đảm bảo an toàn thời gian thiết lập)
* **Hold Worst Slack:** `+0.32 ns` (Đảm bảo an toàn thời gian giữ dữ liệu)

---

## 🔍 Kết quả kiểm tra vật lý (Signoff Verification)

* **DRC (Design Rule Check):** `Passed` (`0` vi phạm khoảng cách vật lý).
* **LVS (Layout vs Schematic):** `Passed` (`Circuits match uniquely` - Sơ đồ nguyên lý và bản vẽ layout khớp nhau hoàn toàn).

---

## 🖼️ Hình ảnh trực quan thiết kế (Layout & Reports)

### 1. Thống kê tổng hợp logic (Yosys Statistics) & Báo cáo Timing
![Synthesis and Timing Reports](https://github.com/user-attachments/assets/ca3a3441-976e-41da-9222-7d27fcd374ec)

### 2. Bản vẽ định tuyến mạch vật lý (Routing Layout trên OpenROAD)
![Routing Layout](https://github.com/user-attachments/assets/b6c0b23e-4e3f-42ee-b7e0-663cec4317ae)

---
