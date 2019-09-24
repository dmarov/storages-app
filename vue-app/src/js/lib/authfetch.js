class AuthError extends Error {

    constructor(message = 'authorization required') {

        super(message);
        this.name = "AuthError";
    }
}


export default async function(url, params = {}, key = 'token') {

    let token = sessionStorage.getItem(key);

    if (token === null) throw new AuthError();

    try {

        url = new URL(url);

    } catch(e) {

        url = new URL(url, location.origin);

    } finally {

        let headersObj = Object.isObject(params.headers) ? params.headers : {};
        headersObj = {...headersObj, 'Authorization': 'Bearer ' + token };

        params.headers = new Headers(headersObj);
        let response = await fetch(url, params);

        if (response.status == 401) throw new AuthError();

        return response;
    }
};
