<?php if ($this->vt == "kvm" || $this->vt == "xenhvm") {
    if (!$this->nodelocked && $this->htmlvnc && $this->htmlvncurl) { ?>
        <script>
            location.href = '/nvnc.php?_v=<?=$this->vid;?>&ssl=1';
        </script>
    <?php } else { ?>
        <script>
            location.href = 'remote.php?_v=<?=$this->vid;?>&_c=html&_s=1&ssl=1';
        </script>
    <?php }
} ?>
