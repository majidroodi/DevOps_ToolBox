<?php
$redisHost = getenv('REDIS_HOST') ?: 'redis';
$redisPort = getenv('REDIS_PORT') ?: 6379;

$redis = new Redis();
try {
    $redis->connect($redisHost, $redisPort);
} catch (Exception $e) {
    die("Cannot connect to Redis: " . $e->getMessage());
}

if (isset($_POST['message']) && !empty($_POST['message'])) {
    $message = strip_tags($_POST['message']);
    $redis->rPush('guestbook_messages', $message);
}

$messages = $redis->lRange('guestbook_messages', 0, -1);
?>

<!DOCTYPE html>
<html>
<head>
    <title>PHP Guestbook</title>
</head>
<body>
    <h1>Guestbook</h1>
    <form method="POST">
        <input type="text" name="message" placeholder="Your message" required>
        <button type="submit">Submit</button>
    </form>

    <h2>Messages:</h2>
    <ul>
        <?php foreach ($messages as $msg): ?>
            <li><?php echo htmlspecialchars($msg); ?></li>
        <?php endforeach; ?>
    </ul>
</body>
</html>

