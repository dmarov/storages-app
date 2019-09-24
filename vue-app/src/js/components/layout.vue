<script>

import Menu from './menu';
import Content from './content';

export default {

    components: {
        'app-menu': Menu,
        'app-content': Content,
    },
};

</script>
<template lang="pug">

    .container
        app-menu
        app-content
</template>
