<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\GeneralSettings>
 */
class GeneralSettingsFactory extends Factory {
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array {

        return [
            'name'      => fake()->company(),
            'logo'      => 'logo.jpg',
            'banner'    => 'banner.jpg',
            'slogan'    => fake()->title(),
            'email'     => fake()->companyEmail(),
            'phone'     => '0712345678',
            'phone_2'   => '0912345678',
            'address'   => fake()->address(),
            'zip_code'  => '0000',
            'facebook'  => 'fb.com',
            'youtube'   => 'youtube.com',
            'twitter'   => 'twitter.com',
            'instagram' => 'instagram.com',
        ];
    }
}
