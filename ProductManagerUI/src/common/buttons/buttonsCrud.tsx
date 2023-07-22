import { Button, ButtonGroup } from '@mui/material';
import * as React from 'react'
import { CRUDButtonModel } from './model/buttonsCrud.model';

type ButtonCRUDProps = {
  model: CRUDButtonModel;
};
 
function ButtonsCRUD({ model }: ButtonCRUDProps) {
  let buttons = [];
  let key: keyof CRUDButtonModel;

  for(key in model){
    buttons.push(
    {
      order: model[key].order,
      element: <Button onClick={(event) => model[key].handleClick(event) } data-button-type={key} disabled={model[key].enabled}>{model[key].text}</Button>
    })
  }

  console.log("buttons");
  console.log(buttons);


  buttons.sort((current, next) => current.order - next.order);

  return (
    <ButtonGroup>
      {buttons.map(item => item.element)}
    </ButtonGroup>
  )
}

export default ButtonsCRUD;