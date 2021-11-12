<?php

require_once 'DB.php';

/**
 *
 */
abstract class Model
{

    /**
     *      Forces child classes to define theses methods
     */

    /**
     * Insert from the value of the attributes of the class
     * @return int last insert id
     */
    abstract public function create(): bool;

    /**
     * Update db record from object
     * @return bool
     */
    abstract public function save(): bool;

    /**
     * Delete from object id proprety
     * @return bool
     */
    abstract public function delete(): bool;

    /**
     *  Create db record from object
     * @param int $id
     * @return object|null
     */
    abstract static function find(int $id): ?object;

    /**
     * Create object, but no db record
     * @param array $fields
     * @return object
     */
    abstract static function make(array $fields): object;


    /**
     * Common methods
     */

    /**
     * Extract object name and convert it to its equivalent in table name
     * @return string
     */
    private static function getTable(): string
    {
        return strtolower(get_called_class() . 's');
    }

    /**
     * Get all from current table
     * @return array
     */
    public static function all(): array
    {
        $res = DB::selectMany("SELECT * FROM " . self::getTable(), []);
        return $res === false ? [] : $res;
    }

    /**
     * Get all according to criteria and value
     * @param string $criteria
     * @param string $criteri
     * @param $value
     * @return array
     */
    public static function where(string $criteria, $value): array
    {
        $query = "SELECT * FROM " . self::getTable() . " WHERE " . $criteria . " = :" . $criteria;
        $res = DB::selectMany($query, [$criteria => $value]);
        return $res === false ? [] : $res;
    }

    /**
     * Delete entry by id
     * @param int $id
     * @return bool
     */
    static function destroy(?int $id): bool
    {
        return DB::execute("DELETE FROM " . self::getTable() . " WHERE id = :id", ['id' => $id]);
    }

    /**
     * Insert values according to given parameters
     * @param array $params associative array, index must be db fields
     * @return int
     */
    static function insert(array $params): int
    {
        $size = count($params);
        $cnter = 0;

        $insert = '';
        $values = '';
        foreach ($params as $field => $v) {
            $insert .= $field;
            $values .= ":$field";

            if ($cnter != $size - 1) {
                $insert .= ", ";
                $values .= ", ";
            }
            ++$cnter;
        }

        return DB::insert("INSERT INTO " . self::getTable() . " ($insert) VALUES ($values)", $params);
    }

    /**
     * Modifies the input given via the id by the given parameters
     * @param array $params associative array, index must be db fields
     * @return bool
     */
    protected function update(int $id, array $params): bool
    {
        $set = '';
        $size = count($params);
        $cnter = 1;

        foreach ($params as $field => $v) {
            $set .= "$field = :$field";
            if ($cnter != $size) {
                $set .= ", ";
            }
            ++$cnter;
        }

        $query = "UPDATE " . self::getTable() . " SET $set WHERE id = $id";
        return DB::execute($query, $params);
    }

    /**
     * Select by id
     * @param int $id
     * @return array
     */
    protected static function select(int $id): array
    {
        $res = DB::selectOne("SELECT * FROM " . self::getTable() . " WHERE id = :id", ['id' => $id]);
        return $res === false ? [] : $res;
    }
}
