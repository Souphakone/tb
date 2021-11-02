<?php ob_start(); ?>
<section class="row">
    <div class="column">
        <a class="button answering column" href="?controller=member">Membres</a>
    </div>
    <div class="column">
        <a class="button managing column" href="/?controller=roles">Roles</a>
    </div>
    <div class="column">
        <a class="button results column" href="/?controller=teams">Teams</a>
    </div>
    <div class="column">
        <a class="button results column" href="/?controller=team">My teams</a>
    </div>
</section>
<?php
$content = ob_get_clean();

require_once 'view/layout.php';

?>