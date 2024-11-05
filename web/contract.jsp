<%-- 
    Document   : contract
    Created on : Nov 5, 2024, 2:18:58 PM
    Author     : nhatk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
            />
        <link
            rel="icon"
            href="img/logo/favicon.png"
            type="image/x-icon"
            />
        <title>Reservation form</title>
        <script src="assets/js/plugin/webfont/webfont.min.js"></script>
        <script>
            WebFont.load({
                google: {families: ["Public Sans:300,400,500,600,700"]},
                custom: {
                    families: [
                        "Font Awesome 5 Solid",
                        "Font Awesome 5 Regular",
                        "Font Awesome 5 Brands",
                        "simple-line-icons",
                    ],
                    urls: ["assets/css/fonts.min.css"],
                },
                active: function () {
                    sessionStorage.fonts = true;
                },
            });
        </script>

        <!-- CSS Files -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        <link rel="stylesheet" href="assets/css/plugins.min.css" />
        <link rel="stylesheet" href="assets/css/kaiadmin.min.css" />
        <style>
            @media print {
                /* Ẩn mọi thứ ngoại trừ phần bạn muốn in */
                body * {
                    visibility: hidden;
                }
                .print-section, .print-section * {
                    visibility: visible;
                }
                #exportButton{
                    visibility: hidden;
                }
                .print-section {
                    position: absolute;
                    left: 0;
                    top: 0;
                }
            }
        </style>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                background-color: #f2f2f2;
            }
            .invoice-container {
                width: 600px;
                background-color: white;
                padding: 20px;
                border: 1px solid #ddd;
            }
            .header, .footer {
                text-align: center;
                margin-bottom: 20px;
            }
            .header h1 {
                font-size: 24px;
                margin: 0;
            }
            .header p {
                margin: 5px 0;
            }
            .section-title {
                text-align: center;
                font-weight: bold;
                font-size: 18px;
                margin: 20px 0;
            }
            .info, .table-container, .total-container {
                margin-bottom: 15px;
            }
            .info div, .total-container div {
                display: flex;
                justify-content: space-between;
                padding: 5px 0;
            }
            .table-container table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 10px;
            }
            .table-container th, .table-container td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: center;
            }
            .table-container th {
                background-color: #f2f2f2;
                font-weight: bold;
            }
            .total-container div {
                font-weight: bold;
            }
            .footer {
                font-size: 12px;
                color: #777;
            }
        </style>
    </head>
    <body>
        <jsp:include page="sidebarReceptionist.jsp"/>

        <div class="invoice-container print-section">
            <!-- Header Section -->
            <div class="header">
                <h1>AliHotel</h1>
                <p>Address: 412 Nguyễn Thị Minh Khai, Quận 3</p>
                <p>Tel: 0929 292 606</p>
            </div>

            <!-- Invoice Information -->
            <div class="info">
                <div>
                    <span><strong>Mã đặt phòng:</strong> DP000001</span>
                    <span><strong>Người xuất phiếu:</strong> Trung</span>
                </div>
                <div>
                    <span><strong>Ngày xuất:</strong> 19/05/2023 06:20</span>
                </div>
            </div>

            <!-- Title -->
            <div class="section-title">PHIẾU ĐẶT PHÒNG</div>

            <!-- Customer Information -->
            <div class="info">
                <div><strong>Khách hàng:</strong> Thịnh</div>
                <div><strong>Điện thoại:</strong> 0921212318</div>
                <div><strong>Email:</strong> </div>
            </div>

            <!-- Table Section -->
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>Nội dung</th>
                            <th>SL</th>
                            <th>Đơn giá</th>
                            <th>Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>VIP 01<br>20/05/2023 14:00 - 22/05/2023 12:00</td>
                            <td>2</td>
                            <td>2,300,000 <del>2,500,000</del></td>
                            <td>4,600,000</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Notes Section -->
            <div class="info">
                <strong>Ghi chú:</strong>
            </div>

            <!-- Total Section -->
            <div class="total-container">
                <div>
                    <span>Tổng tiền hàng:</span>
                    <span>4,600,000</span>
                </div>
                <div>
                    <span>Chiết khấu:</span>
                    <span>0</span>
                </div>
                <div>
                    <span><strong>Tổng cộng:</strong></span>
                    <span><strong>4,600,000</strong></span>
                </div>
                <div>
                    <span>Đã thanh toán:</span>
                    <span>1,000,000</span>
                </div>
            </div>
            <!--<button id="exportButton" onclick="exportPDF()" style="position: relative; left: 470px; top: -648px;">Export PDF</button>-->
            <button id="exportButton" onclick="window.print()" style="position: relative; left: 470px; top: -648px;">Export PDF</button>
        </div>
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <script src="assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="assets/js/core/popper.min.js"></script>
    <script src="assets/js/core/bootstrap.min.js"></script>
    <!-- Datatables -->
    <script src="assets/js/plugin/datatables/datatables.min.js"></script>
    <!-- Kaiadmin JS -->
    <script src="assets/js/kaiadmin.min.js"></script>

    <!--    <script>
                    function exportPDF() {
                        const {jsPDF} = window.jspdf;
                        const doc = new jsPDF();
    
                        // Chọn phần cần xuất PDF
                        const invoiceElement = document.querySelector('.invoice-container');
    
                        // Sử dụng html2canvas để chuyển phần tử HTML sang ảnh
                        html2canvas(invoiceElement).then(canvas => {
                            const imgData = canvas.toDataURL('image/png');
                            const imgWidth = 190; // Chiều rộng của ảnh trong PDF
                            const pageHeight = 295; // Chiều cao của trang PDF
                            const imgHeight = canvas.height * imgWidth / canvas.width;
                            let heightLeft = imgHeight;
                            let position = 10;
    
                            doc.addImage(imgData, 'PNG', 10, position, imgWidth, imgHeight);
                            heightLeft -= pageHeight;
    
                            // Nếu nội dung vượt quá một trang, thêm trang mới
                            while (heightLeft >= 0) {
                                position = heightLeft - imgHeight;
                                doc.addPage();
                                doc.addImage(imgData, 'PNG', 10, position, imgWidth, imgHeight);
                                heightLeft -= pageHeight;
                            }
    
                            // Lưu file PDF
                            doc.save('PhieuDatPhong.pdf');
                        });
                    }
        </script>-->
    <script>
                function exportPDF() {
                    const {jsPDF} = window.jspdf;
                    const doc = new jsPDF();

                    // Chọn phần tử cần xuất PDF
                    const invoiceElement = document.querySelector('.invoice-container');
                    const exportButton = document.getElementById('exportButton');

                    // Ẩn nút "Export PDF" trước khi chụp
                    exportButton.style.display = 'none';

                    // Sử dụng html2canvas để chuyển phần tử HTML sang ảnh
                    html2canvas(invoiceElement).then(canvas => {
                        const imgData = canvas.toDataURL('image/png');
                        const imgWidth = 190; // Chiều rộng của ảnh trong PDF
                        const pageHeight = 295; // Chiều cao của trang PDF
                        const imgHeight = canvas.height * imgWidth / canvas.width;
                        let heightLeft = imgHeight;
                        let position = 10;

                        doc.addImage(imgData, 'PNG', 10, position, imgWidth, imgHeight);
                        heightLeft -= pageHeight;

                        // Nếu nội dung vượt quá một trang, thêm trang mới
                        while (heightLeft >= 0) {
                            position = heightLeft - imgHeight;
                            doc.addPage();
                            doc.addImage(imgData, 'PNG', 10, position, imgWidth, imgHeight);
                            heightLeft -= pageHeight;
                        }

                        // Hiện lại nút "Export PDF" sau khi hoàn tất
                        exportButton.style.display = 'block';

                        // Lưu file PDF
                        doc.save('PhieuDatPhong.pdf');
                    });
                }
    </script>

</html>
