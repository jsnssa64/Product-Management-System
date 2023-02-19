import { IUnits } from "./IUnits";

export default class Units implements IUnits {
    constructor(readonly code: string, readonly unit: string){}
}

export type UnitType = Record<string, Units>;