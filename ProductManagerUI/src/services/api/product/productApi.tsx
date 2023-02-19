import { ApiCore } from "../utilities/core";

class ProductApi extends ApiCore {
    massUpdate: () => void;
}

const url = 'products';
const plural = 'products';
const single = 'product';

const apiTasks = new ProductApi({
  getAll: true,
  getSingle: true,
  post: true,
  put: false,
  patch: true,
  delete: false,
  url: url,
  plural: plural,
  single: single
});

apiTasks.massUpdate = () => {

};

export default apiTasks;