
export default {

    getParam(state, getters) {
        return name => {

            return state.params[name];
        };
    },
};
