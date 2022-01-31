import sqlite3


def get_data_from_additional_table(db, table):
    """
    Получает данные из связанной таблицы.
    :param db: база данных животных.
    :param table: связанная таблица с внешними ключами.
    :return: список данных таблицы.
    """
    with sqlite3.connect(db) as connection:
        cursor = connection.cursor()
        query = f"SELECT * FROM {table}"
        cursor.execute(query)
        result = cursor.fetchall()
        return result


def change_data_in_main_table(db, table, column, list_):
    """
    Заменяет данные в ячейках заданной колонки исходной таблицы на индексы внешних ключей.
    :param db: база данных животных.
    :param table: изменяемая таблица.
    :param column: колонка, в которой изменяем значения.
    :param list_: список ключей из связанной таблицы.
    """
    with sqlite3.connect(db) as connection:
        cursor = connection.cursor()
        for row in list_:
            query = (f"""UPDATE {table}
                    SET {column} = {row[0]}
                    WHERE {column} = '{row[1]}'
                    """)
            cursor.execute(query)
        connection.commit()


additional_table_data = get_data_from_additional_table('test.db', 'animals_type')
print(additional_table_data)
change_data_in_main_table('test.db', 'animals', 'animal_type', additional_table_data)


def get_animal_by_id(index_, db, table):
    """
     Находит информацию о животном по его индексу.
    :param index_: индекс в таблице с данными о животном.
    :param db: база данных животных.
    :param table: таблица с данными животных.
    :return: словарь с информацией о животном.
    """

    with sqlite3.connect(db) as connection:
        cursor = connection.cursor()
        query = f"""SELECT * FROM {table}
                WHERE [index] = {index_}
                """
        cursor.execute(query)
        result = cursor.fetchone()

        if result:
            found_animal_data = {
                "age_upon_outcome": result[1],
                "animal_id": result[2],
                "animal_type": result[3],
                "name": result[4],
                "breed": result[5],
                "color1": result[6],
                "color2": result[7],
                "date_of_birth": result[8],
                "outcome_subtype": result[9],
                "outcome_type": result[10],
                "outcome_month": result[11],
                "outcome_year": result[12],
            }
            return found_animal_data
        else:
            return "Animal not found"

# with sqlite3.connect('test.db') as connection:
#     cursor = connection.cursor()
#     query = (f"""UPDATE 'animals'
#             SET animal_type = 1
#             WHERE animal_type like 'Cat'
#             """)
#     cursor.execute(query)
#     connection.commit()
