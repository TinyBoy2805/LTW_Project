const getData = async (url) => {
    try {
        return await axios.get(url)
            .then(resp => resp.data)
            .catch(error => console.error("Error", error))
    } catch (error) {
        console.error("Error to fetch data", error)
    }
}

const postData = async (url, data) => {
    try {
        return await axios.post(url, data)
            .then(resp => {
                return "Data received successfully (Status" + resp.data + ")";
            })
            .catch(error => console.error("Error", error))
    } catch (error) {
        console.error("Error to fetch data", error);
    }
}

export {
    getData,
    postData
}