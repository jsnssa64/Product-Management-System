import { IPermissionsItem } from "@Common/shared/permissions";

interface IButtonModel extends IPermissionsItem {
    handleClick: (event: React.MouseEvent<HTMLButtonElement>, state: string) => void;
    text: string;
    order: number;
}
  
  class ButtonModel implements IButtonModel {
    order: number;
    
    constructor(public text: string, 
                public enabled: boolean,
                public handleClick: (event: React.MouseEvent<HTMLButtonElement>) => void) { }
  }
  
  class CRUDButtonModel {
    Update?: ButtonModel;
    Delete?: ButtonModel;
    Create?: ButtonModel;
  }

  export { CRUDButtonModel, ButtonModel }