<?php

namespace App\Http\Controllers;
use View;

use App\Http\Controllers\UserController;
use App\Models\User;
use App\Models\Products;
use Illuminate\Http\Request;
use Session;

class UserController extends Controller
{
    /**
     * add/update product here
     */
    public function add_update_product(Request $request, $id = null)
    {
        $data = [];

        if(isset($id) && !empty($id)){
            $Products = $data['Products'] = Products::findOrFail($id);
            $data['title'] = "Update Product";
        } else {
            $Products = $data['Products'] = new Products();
            $data['title'] = "Add Product";
        }
        
        try {
            if($request->method() == "POST"){
            // update here 
            if(isset($id) && !empty($id)){
                if($Products){
                    $Products->name = $request->input("name");
                    $Products->unit_price = $request->input("unit_price");
                    $Products->currency = $request->input("currency");
                    $Products->available_quantity = $request->input("available_quantity");
                    $Products->description = $request->input("description");
                    $Products->product_category = $request->input("product_category");
                    $Products->status = $request->input("status");
                    $Products->updated_on = now();
                    $Products->save();
                    Session::flash('message', 'Successfully Updated!');
                    Session::flash('alert-class', 'alert-success');
                } else { 
                    Session::flash('message', 'Could not update!');
                    Session::flash('alert-class', 'alert-danger'); 
                }
            } else {
                $Products->name = $request->input("name");
                $Products->unit_price = $request->input("unit_price");
                $Products->currency = $request->input("currency");
                $Products->available_quantity = $request->input("available_quantity");
                $Products->description = $request->input("description");
                $Products->product_category = $request->input("product_category");
                $Products->status = $request->input("status");
                $Products->added_on = $Products->updated_on = now();
                $Products->save();
                Session::flash('message', 'Product added successfully!');
                Session::flash('alert-class', 'alert-success');
                $data['Products'] = new Products();
                return View::make('add-product')->with('data', $data);
            }
        }
        return View::make('add-product')->with('data', $data);
            
        } catch (\Throwable $th) {
            Session::flash('message', 'Exception occured!');
            Session::flash('alert-class', 'alert-danger'); 
        }
    }

    /**
     * view products
     */
    public function view_product()
    {
        $data = [];
        $data['title'] = "View Product";
        
        try {
            $data['Products'] = Products::all();
            return View::make('view-product')->with('data', $data);
        } catch (\Throwable $th) {
            echo '<pre>';
            print_r($th);
            echo '<pre/>';
            die;
        }
    }

    /**
     * delete product
     */
    public function delete_product($id = null)
    {
        $data = [];
        try {
            $Products = Products::findOrFail($id);
            $Products->status = 0;
            $Products->save();
            Session::flash('message', 'Successfully deleted!');
            Session::flash('alert-class', 'alert-success'); 
            return redirect()->back();
        } catch (\Throwable $th) {
            echo '<pre>';
            print_r($th);
            echo '<pre/>';
            die;
        }
    }

    /**
     * cart view
     */
    public function cart_view()
    {
        $data = [];
        $data['title'] = "Available Products";
        
        try {
            $data['Products'] = Products::where('status', "!=", '0')->get();            
            return View::make('cart-view')->with('data', $data);
        } catch (\Throwable $th) {
            echo '<pre>';
            print_r($th);
            echo '<pre/>';
            die;
        }
    }
}