import { apiProvider } from "./provider";

export class ApiCore {
    getSingle: (id: string) => any;
    getAll: () => any;
    post: (model: object) => any;
    delete: (id: string) => any;
    patch: (model: object) => any;
    put: (model: object) => any;
    
    constructor(options: IOptions) {
        if (options.getAll) {
            this.getAll = () => {
                return apiProvider.getAll(options.url);
            };
        }
  
        if (options.getSingle) {
            this.getSingle = (id) => {
                return apiProvider.getSingle(options.url, id);
            };
        }
  
        if (options.post) {
            this.post = (model: object) => {
                return apiProvider.post(options.url, model);
            };
        }
  
        if (options.put) {
            this.put = (model: object) => {
                return apiProvider.put(options.url, model);
            };
        }
  
        if (options.patch) {
            this.patch = (model: object) => {
                return apiProvider.patch(options.url, model);
            };
        }
  
        if (options.delete) {
            this.delete = (id: string) => {
                return apiProvider.remove(options.url, id);
            };
        }
    }
}