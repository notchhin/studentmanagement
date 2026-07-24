<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Database\Seeders\RoleSeeder;
use Illuminate\Support\Facades\DB;
use Database\Seeders\PermissionSeeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0');

        try {
            foreach ([
                'permission_role',
                'role_user',
                'permissions',
                'roles',
                'academic_classes',
                'academic_years',
                'times',
                'levels',
                'rooms',
                'teachers',
                'students',
                'app_settings',
            ] as $table) {
                DB::table($table)->truncate();
            }

            DB::table('users')->updateOrInsert(
                ['email' => 'super@admin.com'],
                [
                    'id' => '6a0652a1-c83f-4233-9bdb-85ce5851dca7',
                    'school_id' => 57,
                    'username' => 'superadmin',
                    'password' => bcrypt('Both@123'),
                    'owner' => true,
                    'is_super' => true,
                ]
            );

            $this->call([
                PermissionSeeder::class,
                RoleSeeder::class,
            ]);

            // DB::unprepared(file_get_contents(database_path('sql/data.sql')));
        } finally {
            DB::statement('SET FOREIGN_KEY_CHECKS=1');
        }

        $this->command->info('table seeded!');
    }
}
