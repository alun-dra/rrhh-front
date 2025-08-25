// src/services/afp.js
import api from "./api";

/**
 * Endpoints:
 *  GET    /afps            (opcional: ?q=texto, otras params)
 *  GET    /afps/:id
 *  POST   /afps
 *  PUT    /afps/:id
 *  DELETE /afps/:id
 */
const list = (params = {}) => api.get("/afp", { params }).then(r => r.data);
const get  = (id)         => api.get(`/afp/${id}`).then(r => r.data);
const create = (payload)  => api.post("/afp", payload).then(r => r.data);
const update = (id, payload) => api.put(`/afp/${id}`, payload).then(r => r.data);
const remove = (id)       => api.delete(`/afp/${id}`).then(r => r.data);

export const AfpService = { list, get, create, update, remove };
export default AfpService;
