import axios from 'axios';

const API_URL = 'http://localhost:3091';
let axiosInstance = axios.create({
  baseURL: API_URL,
  headers: {
    'Access-Control-Allow-Origin': '*',
    'Content-Type': 'application/json'
  }
});

axiosInstance.interceptors.request.use(request => {
  request.params = request.params || {};
  request.params['lang'] =  localStorage.lang;
  return request;
});

export default axiosInstance;
