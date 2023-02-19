import { ICurrency } from "../currency/ICurrency";
import Units from "../unit/Units";

export interface IProduct {
    Id: number,
    Units: number,
    BrandName: string,
    Title: string,
    Description: string,
    Weight: number,
    Uom: Units,
    NetPrice: number,
    Currency: ICurrency
}