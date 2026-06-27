<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= defined('APP_NAME') ? APP_NAME : 'Jewelry BI Dashboard' ?></title>
    
    <!-- Google Fonts: Inter -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    
    <!-- Custom Styles -->
    <link rel="stylesheet" href="/assets/css/variables.css">
    <link rel="stylesheet" href="/assets/css/custom.css">
    <!-- Print Styles -->
    <link rel="stylesheet" href="/assets/css/print.css" media="print">
</head>
<body class="bg-body">

    <!-- Print Header (only visible when printing) -->
    <div class="print-header">
        <h2>💎 Jewelry Business Intelligence System</h2>
        <p>Report generated on <?= date('d M Y, h:i A') ?> | <?= defined('APP_NAME') ? APP_NAME : 'Jewelry BI' ?></p>
    </div>

    <!-- Main Wrapper -->
    <div class="d-flex w-100 min-vh-100">
