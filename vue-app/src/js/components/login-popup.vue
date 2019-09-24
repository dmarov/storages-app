<script>

export default {

    data: _ => {
        return {
            username: undefined,
            password: undefined,
        };
    },
    methods: {
        setUser() {
        
        
        }
    },
}

</script>
<template lang='pug'>

    .login-popup
        input.login-popup__field(placeholder="username" v-model="username")
        input.login-popup__field(placeholder="password" type="password" v-model="password")
        button.login-popup__field(@click='setUser()') Login

</template>
