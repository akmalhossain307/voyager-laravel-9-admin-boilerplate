<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFixedAssetConfigTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Drop tables if they exist
        Schema::dropIfExists('item_categories');
        Schema::dropIfExists('counting_units');
        Schema::dropIfExists('supplier_infos');
        Schema::dropIfExists('financial_years');
        Schema::dropIfExists('org_infos');
        Schema::dropIfExists('post_infos');

        // Create item_categories table
        Schema::create('item_categories', function (Blueprint $table) {
            $table->id();
            $table->string('category_name', 100);
            $table->tinyInteger('posting_type')->comment('1 = Draft, 2 = Final');
            $table->dateTime('cat_added_on');
            $table->bigInteger('cat_added_by')->unsigned()->comment('User ID');
            $table->dateTime('cat_edited_on')->nullable();
            $table->bigInteger('cat_edited_by')->nullable()->unsigned()->comment('User ID');
            $table->string('operation_ip', 50);
        });

        // Create counting_units table
        Schema::create('counting_units', function (Blueprint $table) {
            $table->id();
            $table->string('unit_name', 75);
            $table->tinyInteger('posting_type')->comment('1 = Draft, 2 = Final');
            $table->dateTime('unit_added_on');
            $table->bigInteger('unit_added_by')->unsigned()->comment('User ID');
            $table->dateTime('unit_edited_on')->nullable();
            $table->bigInteger('unit_edited_by')->nullable()->unsigned()->comment('User ID');
            $table->string('operation_ip', 50);
        });

        // Create supplier_infos table
        Schema::create('supplier_infos', function (Blueprint $table) {
            $table->id();
            $table->string('supplier_name', 200);
            $table->string('contact_person', 100)->nullable();
            $table->string('supplier_mobile', 30);
            $table->string('supplier_email', 100)->nullable();
            $table->string('supplier_address', 500)->nullable();
            $table->tinyInteger('posting_type')->comment('1 = Draft, 2 = Final');
            $table->string('comments', 300)->nullable();
            $table->dateTime('supl_added_on');
            $table->bigInteger('supl_added_by')->unsigned()->comment('User ID');
            $table->dateTime('supl_edited_on')->nullable();
            $table->bigInteger('supl_edited_by')->nullable()->unsigned()->comment('User ID');
            $table->string('operation_ip', 50);
        });

        // Create financial_years table
        Schema::create('financial_years', function (Blueprint $table) {
            $table->id();
            $table->date('from_year');
            $table->date('to_year');
            $table->tinyInteger('fin_status')->default(1)->comment('1 = ACTIVE, 2 = INACTIVE');
            $table->dateTime('fin_added_on');
            $table->bigInteger('fin_added_by')->unsigned()->comment('User ID');
            $table->dateTime('fin_edited_on')->nullable();
            $table->bigInteger('fin_edited_by')->nullable()->unsigned()->comment('User ID');
            $table->string('operation_ip', 50);
        });

        // Create org_infos table
        Schema::create('org_infos', function (Blueprint $table) {
            $table->id();
            $table->string('org_name_en', 75);
            $table->string('org_name_bn', 75)->nullable();
            $table->string('org_phone', 25)->nullable();
            $table->string('org_mobile', 25)->nullable();
            $table->string('org_email', 100)->nullable();
            $table->string('org_address', 250)->nullable();
            $table->decimal('org_main', 1, 0)->default(0);
            $table->enum('org_type', ['HQ', 'ZN', 'AR', 'BR', 'ORG'])->nullable();
        });

        // Create post_infos table
        Schema::create('post_infos', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('org_id')->unsigned();
            $table->string('post_name_en', 75);
            $table->string('post_name_bn', 75)->nullable();
            $table->dateTime('post_added_on');
            $table->bigInteger('post_added_by')->unsigned()->comment('User ID');
            $table->dateTime('post_edited_on')->nullable();
            $table->bigInteger('post_edited_by')->nullable()->unsigned()->comment('User ID');
            $table->string('operation_ip', 50);

            // Foreign key constraint
            $table->foreign('org_id')->references('id')->on('org_infos');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('post_infos');
        Schema::dropIfExists('org_infos');
        Schema::dropIfExists('financial_years');
        Schema::dropIfExists('supplier_infos');
        Schema::dropIfExists('counting_units');
        Schema::dropIfExists('item_categories');
    }
}
