<?php

namespace App\Http\Controllers\Api;

use App\Models\Product;
use App\Models\Cart;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CartController extends Controller
{
    /**
     * View the cart items.
     */
    public function index(Request $request)
    {
        $user = $request->user(); // Get authenticated user

        // Retrieve the user's cart
        $cart = Cart::where('user_id', $user->id)->first();
        $items = json_decode($cart->items, true);

        $totalPrice = array_reduce($items, function($carry, $item) {
            return $carry + ($item['price'] * $item['quantity']);
        }, 0);

        return response()->json([
            'cart' => $items,
            'totalPrice' => $totalPrice
        ], 200);
    }

    /**
     * Add a product to the cart.
     */
    public function add(Request $request, $id)
    {
        $user = $request->user(); // Get authenticated user

        // Find or create the user's cart
        $cart = Cart::firstOrCreate(['user_id' => $user->id]);
    
        // Get current cart items or initialize an empty array
        $items = $cart->items ?? [];

        if (is_array($items) === false) {
            $items = json_decode($items, true);
        }

        $product = Product::findOrFail($id); // Find product by ID

        // Check if product already in cart, then update quantity
        if (isset($items[$id])) {
            $items[$id]['quantity']++;
        } else {
            // Add product to cart
            $items[$id] = [
                "name"     => $product->name,
                "price"    => $product->price,
                "image"    => $product->image,
                "quantity" => 1,
            ];
        }

        // Update the cart
        $cart->items = $items;
        $cart->save();

        return response()->json([
            'message' => 'Product added to cart successfully!',
            'cart' => $items
        ], 201);
    }

    /**
     * Remove a product from the cart.
     */
    public function remove(Request $request, $id)
    {
        $user = $request->user(); // Get authenticated user

        // Find the user's cart
        $cart = Cart::where('user_id', $user->id)->first();

        if ($cart) {
            $items = json_decode($cart->items, true);

            if (isset($items[$id])) {
                unset($items[$id]);  // Remove the item from the cart

                // Update the cart
                $cart->items = $items;
                $cart->save();
            }
        }

        return response()->json([
            'message' => 'Product removed from cart!',
            'cart' => $cart->items
        ], 200);
    }

    /**
     * Clear the entire cart.
     */
    public function clear(Request $request)
    {
        $user = $request->user(); // Get authenticated user

        // Find the user's cart and clear it
        $cart = Cart::where('user_id', $user->id)->first();

        if ($cart) {
            $cart->items = [];
            $cart->save();
        }

        return response()->json([
            'message' => 'Cart cleared successfully!',
        ], 200);
    }
}
