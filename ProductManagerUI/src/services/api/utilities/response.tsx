interface results {
    results?: any[],
    data?: string 
}

export function handleResponse(response: results) {
    if (response.results) {
        return response.results;
    }

    if (response.data) {
        return response.data;
    }

    return response;
}

export function handleError(error: results) {
    if (error.data) {
        return error.data;
    }
    return error;
}