import api from "./api";

export async function loginRequest({ email, password }) {
  const { data } = await api.post(
    "/auth/login",
    { email, password },
    { headers: { "x-api-key": "alvaro" } }  
  );
  return data;
}
