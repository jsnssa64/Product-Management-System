import axios, { AxiosResponse } from "axios";
import Units, { UnitType } from "../../../data/product/unit/Units";
import { handleError, handleResponse } from "./response";

const BASE_URL = 'http://127.0.0.1:3333/api/v1'; 

const getAll = (resource: string) => { 
  return axios 
    .get(`${BASE_URL}/${resource}`) 
    .then(handleResponse) 
    .catch(handleError); 
}; 

const getSingle = (resource: string, id: string) => { 
  return axios 
    .get(`${BASE_URL}/${resource}/${id}`) 
    .then(handleResponse) 
    .catch(handleError); 
}; 

const post = (resource: string, model: object) => { 
  return axios 
    .post(`${BASE_URL}/${resource}`, model) 
    .then(handleResponse) 
    .catch(handleError); 
}; 

const put = (resource: string, model: object) => { 
  return axios 
    .put(`${BASE_URL}/${resource}`, model) 
    .then(handleResponse) 
    .catch(handleError); 
}; 

const patch = (resource: string, model: object) => { 
  return axios 
    .patch(`${BASE_URL}/${resource}`, model) 
    .then(handleResponse) 
    .catch(handleError); 
}; 

const remove = (resource: string, id: string) => { 
  return axios 
    .delete(`${BASE_URL}/${resource}`, { 
        data: {
          Id: id
        }
     }) 
    .then(handleResponse) 
    .catch(handleError); 
}; 

export const apiProvider = { 
  getAll, 
  getSingle, 
  post, 
  put, 
  patch, 
  remove, 
};


    const units: UnitType = {
        Grams: new Units("g", "grams"),
        Kilograms: new Units("kg", "kilograms"),
        Millilitres: new Units("ml", "millilitre"),
        Litre: new Units("l", "litre"),
        Centilitre: new Units("cl", "centilitre")
    }