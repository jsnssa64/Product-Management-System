import { ApiCore } from "../utilities/core";

const url = 'brands';
const plural = 'brands';
const single = 'brand';

const apiTasks = new ApiCore({
  getAll: true,
  getSingle: false,
  post: true,
  put: false,
  patch: true,
  delete: false,
  url: url,
  plural: plural,
  single: single
});

export default apiTasks;